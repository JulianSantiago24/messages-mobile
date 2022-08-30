
import 'package:flutter_app_messages/src/models/comments_model.dart';
import 'package:flutter_app_messages/src/models/posts_model.dart';
import 'package:flutter_app_messages/src/services/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsFirstService extends Mock implements PostsService {}
class MockNewsSecondService extends Mock implements CommentsService {}

void main() {

  MockNewsFirstService mockNewsFirstService;
  MockNewsSecondService mockNewsSecondService;
  

  setUp((){
    mockNewsFirstService = MockNewsFirstService();
    mockNewsSecondService = MockNewsSecondService();
  });

  test(
    'Initial values', 
    (){
      expect(mockNewsSecondService.comments, null);
      expect(mockNewsFirstService.messages, null);
      expect(mockNewsFirstService.ids, null);
    }
  );

  group('getMessages', (){

    void arrangeMessages() {
      when( () => mockNewsFirstService.getMessages()).thenAnswer(
        (_) async => [
          PostsResponse(userId: 1, id: 1, title: 'Test titlte1', body: 'Test body1', isFavorite: false),
          PostsResponse(userId: 2, id: 2, title: 'Test titlte2', body: 'Test body2', isFavorite: false),
          PostsResponse(userId: 3, id: 3, title: 'Test titlte3', body: 'Test body3', isFavorite: false)
        ],
      );
    }

    test("Get messages", 
      () async {
        arrangeMessages();
        await mockNewsFirstService.getMessages();
        verify(() => mockNewsFirstService.getMessages()).called(1);
      }
    );
  });

  group('getComments', (){

    void arrangeGetComments() {
      when( () => mockNewsFirstService.getMessages()).thenAnswer(
        (_) async => [
          CommentsResponse(postId: 1, id: 1, name: 'Test name1', email: 'Test Email1', body: 'Test Body1'),
          CommentsResponse(postId: 2, id: 2, name: 'Test name2', email: 'Test Email2', body: 'Test Body2'),
          CommentsResponse(postId: 3, id: 3, name: 'Test name3', email: 'Test Email3', body: 'Test Body3'),
          
        ],
      );
    }
      test("Get comments", 
        () async {
          arrangeGetComments();
          await mockNewsSecondService.getComments(1);
          verify(() => mockNewsSecondService.getComments(1)).called(1);
        }
      );
  });
}


